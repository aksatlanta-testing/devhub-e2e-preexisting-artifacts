
{{- define "go-echo91147295-fa8f-46f7-bdcc-bdf7dc3abbff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo91147295-fa8f-46f7-bdcc-bdf7dc3abbff.fullname" -}}
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


{{- define "go-echo91147295-fa8f-46f7-bdcc-bdf7dc3abbff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo91147295-fa8f-46f7-bdcc-bdf7dc3abbff.labels" -}}
helm.sh/chart: {{ include "go-echo91147295-fa8f-46f7-bdcc-bdf7dc3abbff.chart" . }}
{{ include "go-echo91147295-fa8f-46f7-bdcc-bdf7dc3abbff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo91147295-fa8f-46f7-bdcc-bdf7dc3abbff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo91147295-fa8f-46f7-bdcc-bdf7dc3abbff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}