
{{- define "go-echodf2f9600-a07c-4f64-a4ca-6351286f22bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf2f9600-a07c-4f64-a4ca-6351286f22bf.fullname" -}}
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


{{- define "go-echodf2f9600-a07c-4f64-a4ca-6351286f22bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf2f9600-a07c-4f64-a4ca-6351286f22bf.labels" -}}
helm.sh/chart: {{ include "go-echodf2f9600-a07c-4f64-a4ca-6351286f22bf.chart" . }}
{{ include "go-echodf2f9600-a07c-4f64-a4ca-6351286f22bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf2f9600-a07c-4f64-a4ca-6351286f22bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf2f9600-a07c-4f64-a4ca-6351286f22bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}