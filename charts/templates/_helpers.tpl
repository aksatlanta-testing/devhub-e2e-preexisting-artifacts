
{{- define "go-echod20ae143-7c2a-4c12-9fe9-50086013320d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod20ae143-7c2a-4c12-9fe9-50086013320d.fullname" -}}
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


{{- define "go-echod20ae143-7c2a-4c12-9fe9-50086013320d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod20ae143-7c2a-4c12-9fe9-50086013320d.labels" -}}
helm.sh/chart: {{ include "go-echod20ae143-7c2a-4c12-9fe9-50086013320d.chart" . }}
{{ include "go-echod20ae143-7c2a-4c12-9fe9-50086013320d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod20ae143-7c2a-4c12-9fe9-50086013320d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod20ae143-7c2a-4c12-9fe9-50086013320d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}