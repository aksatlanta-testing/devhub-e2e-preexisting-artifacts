
{{- define "go-echo287d574c-1e88-42c9-8101-0abacdc2955d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo287d574c-1e88-42c9-8101-0abacdc2955d.fullname" -}}
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


{{- define "go-echo287d574c-1e88-42c9-8101-0abacdc2955d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo287d574c-1e88-42c9-8101-0abacdc2955d.labels" -}}
helm.sh/chart: {{ include "go-echo287d574c-1e88-42c9-8101-0abacdc2955d.chart" . }}
{{ include "go-echo287d574c-1e88-42c9-8101-0abacdc2955d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo287d574c-1e88-42c9-8101-0abacdc2955d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo287d574c-1e88-42c9-8101-0abacdc2955d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}