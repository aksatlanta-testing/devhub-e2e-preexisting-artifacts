
{{- define "go-echoecccb75a-3fcf-455f-87c4-46341926bebe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecccb75a-3fcf-455f-87c4-46341926bebe.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoecccb75a-3fcf-455f-87c4-46341926bebe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecccb75a-3fcf-455f-87c4-46341926bebe.labels" -}}
helm.sh/chart: {{ include "go-echoecccb75a-3fcf-455f-87c4-46341926bebe.chart" . }}
{{ include "go-echoecccb75a-3fcf-455f-87c4-46341926bebe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoecccb75a-3fcf-455f-87c4-46341926bebe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoecccb75a-3fcf-455f-87c4-46341926bebe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}