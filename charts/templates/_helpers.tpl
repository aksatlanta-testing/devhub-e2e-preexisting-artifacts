
{{- define "go-echob7621a43-1cdf-4944-a841-68c080a1749f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob7621a43-1cdf-4944-a841-68c080a1749f.fullname" -}}
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


{{- define "go-echob7621a43-1cdf-4944-a841-68c080a1749f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob7621a43-1cdf-4944-a841-68c080a1749f.labels" -}}
helm.sh/chart: {{ include "go-echob7621a43-1cdf-4944-a841-68c080a1749f.chart" . }}
{{ include "go-echob7621a43-1cdf-4944-a841-68c080a1749f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob7621a43-1cdf-4944-a841-68c080a1749f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob7621a43-1cdf-4944-a841-68c080a1749f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}