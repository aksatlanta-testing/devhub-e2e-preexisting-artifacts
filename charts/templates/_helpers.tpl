
{{- define "go-echo90b2905a-e860-4930-9d7c-1ef672e98f87.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo90b2905a-e860-4930-9d7c-1ef672e98f87.fullname" -}}
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


{{- define "go-echo90b2905a-e860-4930-9d7c-1ef672e98f87.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo90b2905a-e860-4930-9d7c-1ef672e98f87.labels" -}}
helm.sh/chart: {{ include "go-echo90b2905a-e860-4930-9d7c-1ef672e98f87.chart" . }}
{{ include "go-echo90b2905a-e860-4930-9d7c-1ef672e98f87.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo90b2905a-e860-4930-9d7c-1ef672e98f87.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo90b2905a-e860-4930-9d7c-1ef672e98f87.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}