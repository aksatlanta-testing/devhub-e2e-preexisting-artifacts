
{{- define "go-echoc1aea762-c1dd-46a1-ac59-3aa1025ca3ea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1aea762-c1dd-46a1-ac59-3aa1025ca3ea.fullname" -}}
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


{{- define "go-echoc1aea762-c1dd-46a1-ac59-3aa1025ca3ea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1aea762-c1dd-46a1-ac59-3aa1025ca3ea.labels" -}}
helm.sh/chart: {{ include "go-echoc1aea762-c1dd-46a1-ac59-3aa1025ca3ea.chart" . }}
{{ include "go-echoc1aea762-c1dd-46a1-ac59-3aa1025ca3ea.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1aea762-c1dd-46a1-ac59-3aa1025ca3ea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1aea762-c1dd-46a1-ac59-3aa1025ca3ea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}