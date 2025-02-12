
{{- define "go-echoa28252e6-e449-4d4b-8505-8331f4c46aee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa28252e6-e449-4d4b-8505-8331f4c46aee.fullname" -}}
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


{{- define "go-echoa28252e6-e449-4d4b-8505-8331f4c46aee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa28252e6-e449-4d4b-8505-8331f4c46aee.labels" -}}
helm.sh/chart: {{ include "go-echoa28252e6-e449-4d4b-8505-8331f4c46aee.chart" . }}
{{ include "go-echoa28252e6-e449-4d4b-8505-8331f4c46aee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa28252e6-e449-4d4b-8505-8331f4c46aee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa28252e6-e449-4d4b-8505-8331f4c46aee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}