
{{- define "go-echof71683d0-f01e-4bc0-af1f-6293bf8dfcb5.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof71683d0-f01e-4bc0-af1f-6293bf8dfcb5.fullname" -}}
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


{{- define "go-echof71683d0-f01e-4bc0-af1f-6293bf8dfcb5.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof71683d0-f01e-4bc0-af1f-6293bf8dfcb5.labels" -}}
helm.sh/chart: {{ include "go-echof71683d0-f01e-4bc0-af1f-6293bf8dfcb5.chart" . }}
{{ include "go-echof71683d0-f01e-4bc0-af1f-6293bf8dfcb5.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof71683d0-f01e-4bc0-af1f-6293bf8dfcb5.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof71683d0-f01e-4bc0-af1f-6293bf8dfcb5.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}