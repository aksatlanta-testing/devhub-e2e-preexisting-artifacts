
{{- define "go-echo0296f761-683b-4a2d-90c7-559addb7d11c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0296f761-683b-4a2d-90c7-559addb7d11c.fullname" -}}
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


{{- define "go-echo0296f761-683b-4a2d-90c7-559addb7d11c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0296f761-683b-4a2d-90c7-559addb7d11c.labels" -}}
helm.sh/chart: {{ include "go-echo0296f761-683b-4a2d-90c7-559addb7d11c.chart" . }}
{{ include "go-echo0296f761-683b-4a2d-90c7-559addb7d11c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0296f761-683b-4a2d-90c7-559addb7d11c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0296f761-683b-4a2d-90c7-559addb7d11c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}