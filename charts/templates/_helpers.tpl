
{{- define "go-echoeaf14eab-af2d-4086-8454-ccd5cf9c1fca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeaf14eab-af2d-4086-8454-ccd5cf9c1fca.fullname" -}}
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


{{- define "go-echoeaf14eab-af2d-4086-8454-ccd5cf9c1fca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeaf14eab-af2d-4086-8454-ccd5cf9c1fca.labels" -}}
helm.sh/chart: {{ include "go-echoeaf14eab-af2d-4086-8454-ccd5cf9c1fca.chart" . }}
{{ include "go-echoeaf14eab-af2d-4086-8454-ccd5cf9c1fca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeaf14eab-af2d-4086-8454-ccd5cf9c1fca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeaf14eab-af2d-4086-8454-ccd5cf9c1fca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}